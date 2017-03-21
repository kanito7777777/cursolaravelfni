@extends('layouts.app')

@section('content')
<div class="panel-heading"><h4>Nuevo Material</h4></div>
<div class="panel-body">
    {!! Form::open(['url' => '/materials', 
                    'method' => 'POST',
                    'class' => 'form-horizontal',
                    'files' => true]
                  ) !!}
    
        <div class="form-group">
            {!! Form::label('titulo', 'Titulo', ['class'=>'col-md-4 control-label']) !!} 
            <!-- <label for='titulo'>Titulo</label> -->
            <div class="col-md-6">
            {!! Form::text('titulo',null, ['class'=>'form-control', 'required']  ) !!}

            {!! $errors->first('titulo', '<p style="color:red">:message</p>') !!}

            </div>
            <!--<input type="text" name="titulo" id='titulo' value="" > -->
        </div>

        <div class="form-group">
            {!! Form::label('autor', 'Autor', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::text('autor',null, ['class'=>'form-control'] ) !!}
            {!! $errors->first('autor', '<p style="color:red">:message</p>') !!}
            </div>
        </div>

        <div class="form-group">
            {!! Form::label('descripcion', 'Descripcion', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::textarea('descripcion',null, ['class'=>'form-control'] ) !!}
            {!! $errors->first('descripcion', '<p style="color:red">:message</p>') !!}
            </div>
        </div>  

        <div class="form-group">
            {!! Form::label('url', 'Url', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::url('url','http://', ['class'=>'form-control'] ) !!}
            </div>
        </div>  

        <div class="form-group">
            {!! Form::label('portadaImg', 'Portada', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::file('portadaImg',null, ['class'=>'form-control'] ) !!}
            </div>
        </div>    
            
        <div class="form-group">
            {!! Form::label('tipo', 'Tipo', ['class'=>'col-md-4 control-label']) !!} 
            <div class="col-md-6">
            {!! Form::select('tipo', ['Libro'=>'Libro', 'Video'=>'Video'], 'Libro', ['class'=>'form-control'] ) !!}
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