<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Storage;
use Auth;

class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

   /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $res = User::All()->Where('rol', '<>', 'Administrador');

        return view('users.index', compact('res'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //insertar registros
        $datos = $request->all();
        User::create($datos);
        return redirect('users.create');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //buscado un solo registo
        $res = User::Where('email', '=', $id)->first();
        return view('users.show', compact('res'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $res = User::Where('email', '=', $id)->first();
        return view('users.edit', compact('res'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $datos = $request->all();
        $res = User::findOrFail($id);

     
         if (isset($datos['fotoImg']))
        {
           //cargando archivo al servidor
            $img = $request->file('fotoImg');
            $nombreImg = time().'_'.$img->getClientOriginalName();
            Storage::disk('imgFotos')->put($nombreImg, 
                file_get_contents( $img->getRealPath() ) );

            $datos['foto'] = $nombreImg;
        }
        else
        {
            $datos['foto'] = $res->foto;
        }

        $res->update($datos);

        return redirect('users/'.$res->email);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::destroy($id);
        return redirect('users/');
    }
}
