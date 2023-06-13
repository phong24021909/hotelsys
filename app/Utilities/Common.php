<?php


namespace App\Utilities;

use Carbon\Carbon;
use Illuminate\Support\Str;

class Common {
    /**
     * This function uploads a file to a specified path with a unique name generated based on the
     * original file name and current time.
     * 
     * @param file The file that needs to be uploaded. It is an instance of the UploadedFile class.
     * @param path The path where the uploaded file will be stored.
     * 
     * @return the new file name that has been generated after renaming and moving the uploaded file to
     * the specified path.
     */
    public static function upLoadFile($file, $path) {
        $file_name_original = $file->getClientOriginalName();
        $extension = $file->getClientOriginalExtension();
        $file_name_without_extension = Str::replaceLast('.' . $extension, '', $file_name_original);
        
        $str_time_now = Carbon::now()->format('ymd_his');
        $file_name = Str::slug($file_name_without_extension) . '_' . uniqid() . '_' . $str_time_now . '.' . $extension;

        $file->move($path, $file_name);

        return $file_name;
    }
}