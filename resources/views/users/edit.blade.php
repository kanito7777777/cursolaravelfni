@extends('layouts.app')

@section('content')
<div class="panel-heading"><h4>Nuevo Material</h4></div>
<div class="panel-body">
    {!! Form::model($res, 
                    [
                    'url' => ['/users', $res->id], 
                    'method' => 'PATCH',
                    'class' => 'form-horizontal',
                    'files' => true
                    ]
                   ) !!}
    
        <div class="form-group">
            {!! Form::label('nombre', 'Nombre', ['class'=>'col-md-4 control-label']) !!} 
            <!-- <label for='nombre'>nombre</label> -->
            <div class="col-md-6">
            {!! Form::text('nombre',null, ['class'=>'form-control'] ) !!}
            </div>
            <!--<input type="text" name="nombre" id='nombre' value="" > -->
        </div>

        <div class="form-group">
            {!! Form::label('apellido', 'Apellidos', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::text('apellido',null, ['class'=>'form-control'] ) !!}
            </div>
        </div>

        <div class="form-group">
            {!! Form::label('fotoImg', 'Foto', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::file('fotoImg',null, ['class'=>'form-control'] ) !!}
            </div>
        </div>    

        <div class="form-group">
            <div class="col-md-6 col-md-offset-4">
            {!! Form::submit('Aceptar', ['class'=>'btn btn-primary']) !!}
            </div>
        </div>
    {!! Form::close() !!}    
</div>
@endsection
