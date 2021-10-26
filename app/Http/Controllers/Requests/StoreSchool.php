<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreSchool extends FormRequest
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
            
            if(str_contains($this->url(), 'admin/school/add')){
                // $password_rule = 'required|min:5|confirmed';   
                // $name_rule  = 'required|min:3';   
                $name_rule =  'required|unique:schools';
            } else{  //edit case
                $name_rule =  'required|unique:schools,name,'.$this->route('school_id');
            } 

            return [
                'name' => $name_rule,
                'status' => 'required',
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
