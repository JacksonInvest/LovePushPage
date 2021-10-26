<?php
namespace App\Http\Requests;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreReligion extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {    
        if($this->method() == 'POST'){
            if(str_contains($this->url(), 'add')){
                return [
                    'name' => [
                        'required',
                        'max:255',
                        Rule::unique('religions')->where(function($query){
                            return $query->where('deleted_at',null);
                        })
                    ]
                ];
            } else{
                return [
                    // 'name' => 'required|unique:religions,name,'.$this->route('military_id'),
                    'name' => 'required|unique:religions,name,'.$this->route('religion_id').',id,deleted_at,NULL|max:255'
                ];
            }
        } else{
            return [];
        }
    }

}