<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comentario extends Model
{
    //
	protected $table = 'comentarios';

    protected $fillable = [
        'fecha', 'detalle', 'fkMaterial',
    ];

    //desabilitando las fechas
    public $timestamps = false;

}
