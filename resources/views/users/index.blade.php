@extends('layouts.app')

@section('content')

<div class="panel-heading"><h3>Lista de Usuarios</h3></div>
	<div class="panel-body">

	<a href="{{ url('reportes/estadistico') }}">Reporte Estadistico</a>

	<div class="table-responsive">
	<table class="table table-bordered table-responsive table-striped">
	    <thead>
	        <tr>
	            <th> Email</th>
	            <th> Nombre </th>
	            <th> Apellido </th>
	            <th> Rol </th>
	            <th> </th>
	        </tr>
	    </thead>
	    <tbody>
	        @foreach($res as $f)
	        <tr>
	            <td>{{ $f->email }}</td>
	            <td>{{ $f->nombre }}</td>
	            <td>{{ $f->apellido }}</td>
	            <td>{{ $f->rol }}</td>

	            <td>
					@if (Auth::user()->rol =='Administrador')
					<a class="btn btn-primary" href="{{ url('users/'. $f->email) }}">S</a>
	            	<a class="btn btn-warning" href="{{ url('/users/'. $f->email. '/edit') }}">E</a>

	            	<form action="{{ route('users.destroy', $f->id) }}" method="post" onclick="return confirm('Seguro que quiere eliminar el registro?')" style="display: inline">

	            		<input type="hidden" name="_method" value="DELETE">
	            		{{ csrf_field() }}
	            		<button type="submit" class="btn btn-danger">X</button>
	            	</form>	
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