<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreCity extends FormRequest
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
            if(str_contains($this->url(), 'add')){
                $name_rule = [
                    'required',
                    'max:255',
                    Rule::unique('cities')->where(function($query){
                        return $query->where('deleted_at',null);
                    })
                ];

            } else{ //edit
                $city_id    = $this->route('city_id'); 
                $name_rule = 'required|unique:cities,name,'.$city_id.',id,deleted_at,NULL|max:255';
            }

            return [
                'name' => $name_rule
            ];

        } else{
            return [];
        }
    }

}