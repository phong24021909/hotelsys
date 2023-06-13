<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Service\User\UserServiceInterface;
use App\Utilities\Constant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AccountController extends Controller
{

    private $userService;
    public function __construct(UserServiceInterface $userService)
    {
        $this->userService = $userService;
    }

    public function login() {
        return view('front.account.login');
    }

    public function checkLogin(Request $request) {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
            'level' => Constant::user_level_client, //tk muc khach hang
        ];

        $remember = $request->remember;

        if (Auth::attempt($credentials, $remember)) {
            //return redirect('');
            return redirect()->intended('');
        } else {
            return back()
                ->with('notification', 'ERROR: Email or Password is wrong');
        }
    }

    public function logout() {
        Auth::logout();

         return back();
    }

    public function register() {
        return view('front.account.register');
    }

    public function postRegister (Request $request) {
        if ($request->password != $request->password_confirmation) {
            return back()
                ->with('notification', 'ERROR: Confirm password does not match');
        }

        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),// hash password // Hash::make()
            'level' => Constant::user_level_client, // muc Khach hang
        ];

        $this->userService->create($data);

        return redirect('account/login')
            ->with('notification', 'Register Success! Please Login');
    }
}
