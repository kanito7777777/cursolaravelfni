<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Estadistico extends Model
{
    protected $table = 'vwreporteestadistico';

   	protected $fillable = [
        'cant', 'email'
    ];

        //desabilitando las fechas
    public $timestamps = false;
}
