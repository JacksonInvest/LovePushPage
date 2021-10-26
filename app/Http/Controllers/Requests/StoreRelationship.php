<?php
namespace App\Http\Requests;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreRelationship extends FormRequest
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
                        Rule::unique('relationships')->where(function($query){
                            return $query->where('deleted_at',null);
                        })
                    ]
                ];
            } else{
                return [
                    'name' => 'required|unique:political_id,name,'.$this->route('political_id').',id,deleted_at,NULL|max:255'
                ];
            }
        } else{
            return [];
        }
    }

}