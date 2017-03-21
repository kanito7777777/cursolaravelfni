<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Material;
use App\Comentario;

use Storage;
use Auth;

class MaterialsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['index'] ]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $res = Material::All();

        return view('materials.index', compact('res'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('materials.create');
    }

    protected function validar(Request $request, $op)
    {
        $regla = ($op == 'nuevo')? 'required|min:3|unique:materials' : 'required|min:3';
        $this->validate($request, [
           'titulo' => $regla, 
           'autor' => 'required|min:2|max:20|alpha',
           'descripcion' => 'required', 
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validar($request, 'nuevo');

        //cargando archivo al servidor
        $img = $request->file('portadaImg');
        $nombreImg = time().'_'.$img->getClientOriginalName();
        Storage::disk('imgPortadas')->put($nombreImg, 
            file_get_contents( $img->getRealPath() ) );

        //insertar registros
        $datos = $request->all();

        //TODO pendiente para cargar archivos, y fkUsuario
        $datos += ["portada" => $nombreImg];
        $datos += ["fkUsuario" =>Auth::user()->id ];

        //dd($datos);

        Material::create($datos);
        return redirect('materials/create');
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
        $res = Material::findOrFail($id);
        $resCom = Comentario::Where('fkMaterial', '=', $id)->orderBy('id', 'DESC')->Paginate(5);

        return view('materials.show')->with(['res' => $res, 'resCom' => $resCom ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $res = Material::findOrFail($id);
        return view('materials.edit', compact('res'));
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
        $this->validar($request, 'editar');

        $datos = $request->all();
        $res = Material::findOrFail($id);

        if (isset($datos['portadaImg']))
        {
           //cargando archivo al servidor
            $img = $request->file('portadaImg');
            $nombreImg = time().'_'.$img->getClientOriginalName();
            Storage::disk('imgPortadas')->put($nombreImg, 
                file_get_contents( $img->getRealPath() ) );

            $datos['portada'] = $nombreImg;
        }
        else
        {
            $datos['portada'] = $res->portada;
        }

        $res->update($datos);

        return redirect('materials/');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Material::destroy($id);
        return redirect('materials/');
    }
}
