function deleteOk() {
	var resp = 0;
	Swal({
	  title: "¿Estas seguro?",
	  text: "Deseas eliminar este registro",
	  type: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Borrar!'
	}).then((result) => {
		  if (result.value) {
			resp = 1;
		    Swal(
		      'Borrado!',
		      'Registro eliminado',
		      'success'
		    )
		  }else{
			  resp = 0;
		  }	  
	})
	
	return resp;
}
