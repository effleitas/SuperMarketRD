<?php
    $err = isset($_GET['error']) ? $_GET['error'] : null ; 
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: login.php");
		exit;
		}
		
		$rol= $_SESSION['cargo'];
		if($rol=="cajero"){
		header('Location: http://localhost/SuperMarketRD/facturas.php?error=3');
 }

	
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
    $active_usuarios="";	
    $active_proveedores="";
    $active_compras="";
    $active_reportes_ventas="active";
	$title="Reportes de ventas | SuperMarketRD";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
	<?php include("head.php");?>

  </head>
  <body>
	<?php
	include("navbar.php");
	?>  
    <div class="container">
		<div class="panel panel-info">
		<div class="panel-heading">
			<h4><i class='glyphicon glyphicon-search'></i> Buscar Reportes</h4>
		</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="datos_cotizacion">
				
						<div class="form-group row">
							<label for="q" class="col-md-2 control-label">Vendedor o # de factura</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="q" placeholder="Nombre del vendedor o # de factura" onkeyup='load(1);'>
							</div>
							
							
							
							<div class="col-md-3">
								<button type="button" class="btn btn-default" onclick='load(1);'>
									<span class="glyphicon glyphicon-search" ></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
				
				
				
			</form>
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->
			</div>
		</div>	
		
	</div>
	<hr>
	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/VentanaCentrada.js"></script>
	<script type="text/javascript" src="js/reportefacturas.js"></script>

  </body>
</html>