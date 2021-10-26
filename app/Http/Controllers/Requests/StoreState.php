<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreState extends FormRequest
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
                return [
                    'name' => [
                        'required',
                        'max:255',
                        Rule::unique('states')->where(function($query){
                            return $query->where('deleted_at',null);
                        })
                    ]
                ];
            } else{
                return [
                    'name' => 'required|unique:states,name,'.$this->route('state_id').',id,deleted_at,NULL|max:255'
                ];
            }

        } else{
            return [];
        }
    }

}