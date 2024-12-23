const tableLista = document.querySelector("#tableListaProductos tbody");
const tblPendientes = document.querySelector('#tblPendientes');
let productosjson = [];
let tblCalificacion;
const estadoEnviado = document.querySelector('#estadoEnviado');
const estadoProceso = document.querySelector('#estadoProceso');
const estadoCompletado = document.querySelector('#estadoCompletado');
const frmPago = document.querySelector('#frmPago');
document.addEventListener("DOMContentLoaded", function () {
    if (tableLista) {
        getListaProductos();
    }
    //cargar datos pendientes con DataTables
    $('#tblPendientes').DataTable({
        ajax: {
            url: base_url + 'clientes/listarPendientes',
            dataSrc: ''
        },
        columns: [
            { data: 'id' },
            { data: 'monto' },
            { data: 'fecha' },
            { 
                data: null,  // Aquí usas null porque estás manipulando los datos
                render: function (data, type, row) {
                    return row.nombre + ' ' + row.apellido;  // Concatenas nombre y apellido
                }
            },
            { data: 'direccion' },
            { data: 'ciudad' },
            { data: 'telefono' },
            { data: 'accion' }
        ],
        language,
        dom,
        buttons

    });

    tblCalificacion = $('#tblProductos').DataTable({
        ajax: {
            url: base_url + 'clientes/listarProductos',
            dataSrc: ''
        },
        columns: [
            { data: 'id_producto' },
            { data: 'producto' },
            { data: 'precio' },
            { data: 'cantidad' },
            { data: 'calificacion' }
        ],
        language,
        dom,
        buttons

    });

    frmPago.addEventListener('submit', function (e) {
        e.preventDefault();

        // Validación de campos vacíos
        if (frmPago.nombre.value == '' || frmPago.apellido.value == '' || frmPago.direccion.value == '' ||
            frmPago.ciudad.value == '' || frmPago.telefono.value == '' || !frmPago.contraentrega.checked) {
            alertaPerzanalizada("Todos los campos son requeridos", "warning");
        } else {
            // Crear el objeto con los datos del formulario
            const datos = {
                nombre: frmPago.nombre.value,
                apellido: frmPago.apellido.value,
                direccion: frmPago.direccion.value,
                ciudad: frmPago.ciudad.value,
                telefono: frmPago.telefono.value
            };

            // URL de la solicitud
            const url = base_url + 'clientes/registrarPedido';

            // Crear la solicitud XMLHttpRequest
            const http = new XMLHttpRequest();
            http.open('POST', url, true);
            http.setRequestHeader('Content-Type', 'application/json'); // Establecer el tipo de contenido JSON

            // Enviar los datos y los productos en el carrito
            http.send(JSON.stringify({
                datos: datos,  // Datos del formulario
                productos: listaCarrito  // Productos del carrito
            }));

            // Manejar la respuesta
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                    const res = JSON.parse(this.responseText);

                    alertaPerzanalizada(res.msg, res.icono);

                    // Si la respuesta es exitosa, limpiar el carrito y recargar la página
                    if (res.icono == 'success') {
                        localStorage.removeItem('listaCarrito');
                        setTimeout(() => {
                            window.location.reload();
                        }, 2000);
                    }
                }
            };
        }
    });

});

function getListaProductos() {
    let html = '';
    const url = base_url + 'principal/listaProductos';
    const http = new XMLHttpRequest();
    http.open('POST', url, true);
    http.send(JSON.stringify(listaCarrito));
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            if (res.totalPaypal > 0) {
                res.productos.forEach(producto => {
                    html += `<tr>
                        <td>
                            <img class="img-thumbnail rounded-circle" src="${producto.imagen}" alt="" width="100">
                            </td>
                            <td>${producto.nombre}</td>
                            <td><span class="badge bg-warning">${res.moneda + ' ' + producto.precio}</span></td>
                            <td><span class="badge bg-primary">${producto.cantidad}</span></td>
                            <td>${producto.subTotal}</td>
                        </tr>`;
                    //agregrar producto para paypal
                    let json = {
                        "name": producto.nombre,
                        /* Shows within upper-right dropdown during payment approval */
                        "unit_amount": {
                            "currency_code": res.moneda,
                            "value": producto.precio
                        },
                        "quantity": producto.cantidad
                    }
                    productosjson.push(json);
                });
                tableLista.innerHTML = html;
                document.querySelector('#totalProducto').textContent = 'TOTAL A PAGAR: ' + res.moneda + ' ' + res.total;
                // botonPaypal(res.totalPaypal, res.moneda);
            } else {
                tableLista.innerHTML = `
                <tr>
                    <td colspan="5" class="text-center">CARRITO VACIO</td>
                </tr>
                `;
            }

        }
    }
}

function verPedido(idPedido) {
    estadoEnviado.classList.remove('services-icon-wap');
    estadoProceso.classList.remove('services-icon-wap');
    estadoCompletado.classList.remove('services-icon-wap');
    const mPedido = new bootstrap.Modal(document.getElementById('modalPedido'));
    const url = base_url + 'clientes/verPedido/' + idPedido;
    const http = new XMLHttpRequest();
    http.open('GET', url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            let html = '';
            if (res.pedido.proceso == 1) {
                estadoEnviado.classList.add('services-icon-wap');
            } else if (res.pedido.proceso == 2) {
                estadoProceso.classList.add('services-icon-wap');
            } else {
                estadoCompletado.classList.add('services-icon-wap');
            }
            res.productos.forEach(row => {
                let subTotal = parseFloat(row.precio) * parseInt(row.cantidad);
                html += `<tr>
                    <td>${row.producto}</td>
                    <td><span class="badge bg-warning">${res.moneda + ' ' + row.precio}</span></td>
                    <td><span class="badge bg-primary">${row.cantidad}</span></td>
                    <td>${subTotal.toFixed(2)}</td>
                </tr>`;
            });
            document.querySelector('#tablePedidos tbody').innerHTML = html;
            mPedido.show();
        }
    }

}

function agregarCalificacion(id_producto, cantidad) {
    const url = base_url + 'clientes/agregarCalificacion';
    const http = new XMLHttpRequest();
    http.open('POST', url, true);
    http.send(JSON.stringify({
        id_producto: id_producto,
        cantidad: cantidad
    }));
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            const res = JSON.parse(this.responseText);
            alertaPerzanalizada(res.msg, res.icono);
            if (res.icono == 'success') {
                tblCalificacion.ajax.reload();
            }
        }
    }
}

// sb-j6jdb7896999@personal.example.com
// e8O2lR-I


//sb-y3jfn7901325@business.example.com
//Amqes3]/