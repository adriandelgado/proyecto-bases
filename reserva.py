from typing import List, Optional
from database import connection_pool
from dataclasses import dataclass

from usuario import Usuario


@dataclass
class Reservas:
    id: str
    fecha: str
    nombres: str
    id_usuario: str


@dataclass
class ReservasJoined:
    id: str
    fecha: str
    nombres: str
    usuario: Usuario


@dataclass
class ReservasModificada:
    fecha: Optional[str] = None
    nombres: Optional[str] = None


def crear_reserva(nueva_reserva: Reservas):
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute(
        "CALL InsertReserva(%s,%s,%s,%s)",
        (
            nueva_reserva.id,
            nueva_reserva.fecha,
            nueva_reserva.nombres,
            nueva_reserva.id_usuario,
        ),
    )
    connection.commit()
    cursor.close()
    connection.close()


def mostrar_reservas() -> List[ReservasJoined]:
    connection = connection_pool.get_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM ReservasUsuarioView")
    reservas = cursor.fetchall()
    cursor.close()
    connection.close()
    return [
        ReservasJoined(
            id=reserva_id,
            fecha=fecha,
            nombres=reserva_nombres,
            usuario=Usuario(
                email=id_usuario,
                nombres=usuario_nombres,
                apellidos=apellidos,
                contraseña=contraseña,
            ),
        )
        for (
            reserva_id,
            fecha,
            reserva_nombres,
            id_usuario,
            usuario_nombres,
            apellidos,
            contraseña,
        ) in reservas
    ]


def mostrar_reserva(id: int) -> ReservasJoined:
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute("SELECT * FROM ReservasUsuarioView WHERE reserva_id = %s", (id,))
    (
        reserva_id,
        fecha,
        reserva_nombres,
        id_usuario,
        usuario_nombres,
        apellidos,
        contraseña,
    ) = cursor.fetchone()
    cursor.close()
    connection.close()
    return ReservasJoined(
        id=reserva_id,
        fecha=fecha,
        nombres=reserva_nombres,
        usuario=Usuario(
            email=id_usuario,
            nombres=usuario_nombres,
            apellidos=apellidos,
            contraseña=contraseña,
        ),
    )


def editar_reserva(id: int, reserva_modificado: ReservasModificada):
    datos_actuales = mostrar_reserva(id)
    if not reserva_modificado.fecha:
        reserva_modificado.fecha = datos_actuales.fecha
    if not reserva_modificado.nombres:
        reserva_modificado.nombres = datos_actuales.nombres

    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)

    update_query = "CALL UpdateReserva(%s,%s,%s)"
    values = (
        id,
        reserva_modificado.fecha,
        reserva_modificado.nombres,
    )

    cursor.execute(update_query, values)
    connection.commit()

    cursor.close()
    connection.close()


def borrar_reserva(id: int):
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)

    delete_query = "CALL DeleteReserva(%s)"
    values = (id,)

    cursor.execute(delete_query, values)
    connection.commit()

    cursor.close()
    connection.close()
