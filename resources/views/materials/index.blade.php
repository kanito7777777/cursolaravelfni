@extends('layouts.app')

@section('content')
<div class="panel-heading"><h3>Lista de Materiales</h3></div>
	<div class="panel-body">

	<p>
	<a href="{{ url('materials/create') }}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-plus" aria-hidden="true"/>Nuevo</a>
	</p>

	<div class="table-responsive">
	<table class="table table-bordered table-responsive table-striped">
	    <thead>
	        <tr>
	            <th> Titulo </th>
	            <th> Autor </th>
	            <th> Descripcion </th>
	            <th> Url </th>
	            <th> Tipo </th>
	            <th> </th>
	        </tr>

	    </thead>
	    <tbody>
			@foreach ($res as $f)
	        <tr>
	            <td>{{ $f->titulo }}</td>
	            <td>{{ $f->autor }}</td>
	            <td>{{ $f->descripcion }}</td>
	            <td>{{ $f->url }}</td>
	            <td>{{ $f->tipo }}</td>
	            <td>
	            	<a href="{{ url('materials/'.$f->id) }}">S</a>

					@if (!Auth::guest())
					
	            	@if(Auth::user()->rol == 'Administrador')
	            	<a href="{{ url('materials/'.$f->id.'/edit' ) }}">M</a>
	            	
	            	<form action="{{ route('materials.destroy', $f->id) }}" method="POST" 
	            	onclick="return confirm('Seguro que quiere eliminar?')">
	            		{{ csrf_field() }}
	            		<input type="hidden" name="_method" value="DELETE">
	            		<button type="submit">E</button>
	            	</form>
	            	@endif
	            	@endif

	            </td>
	        </tr>
			@endforeach

	     </tbody>
	    </table>	    
	</div>

	</div>
</div>
@endsection