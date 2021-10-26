<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreUser extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {    
        if($this->method() == 'POST'){
            
            if(str_contains($this->url(), 'admin/user/add')){
                // $password_rule = 'required|min:5|confirmed';   
                $password_rule = 'required|min:5';   
                $email_rule =  'required|email|unique:users';
            } else{  //edit case
                // $password_rule = 'nullable|min:5|confirmed';    
                $password_rule = 'nullable|min:5';    
                $email_rule =  'required|email|unique:users,email,'.$this->route('user_id');
            } 

            return [
                'name' => 'required|max:100',
                'gender' => 'required|max:100',
                'seeking_gender' => 'required',
                'current_school' => 'required',
                'major' => 'required',
                'email' => $email_rule,
                'status' => 'required',
                'password' => $password_rule,
                'image' => 'nullable|mimes:jpg,jpeg,png', 
            ];
        } else{
            return [];
        }
    }

    public function messages(){
        return [
            'state_id.required' => 'State is required',
            'city_id.required' => 'City is required',
            'military_id.required' => 'Military is required',
            'political_id.required' => 'Political is required',
            'religion_id.required' => 'Religion is required',
            'relationship_id.required' => 'Relationship is required',
            'image.0.mimes' => 'The image must be a file of type: jpg, jpeg, png.',
            'image.1.mimes' => 'The image must be a file of type: jpg, jpeg, png.',
            'image.2.mimes' => 'The image must be a file of type: jpg, jpeg, png.'
        ];
    }
}
