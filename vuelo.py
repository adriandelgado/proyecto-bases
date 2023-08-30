from typing import List, Optional
from database import connection_pool
from dataclasses import dataclass


@dataclass
class Vuelo:
    numero: int
    areolinea: str
    destino: str
    origen: str
    fechaPartida: str
    fechaLlegada: str
    usuario: str


@dataclass
class VueloModificado:
    areolinea: Optional[str] = None
    destino: Optional[str] = None
    origen: Optional[str] = None
    fechaPartida: Optional[str] = None
    fechaLlegada: Optional[str] = None
    usuario: Optional[str] = None


def crear_vuelo(nuevo_vuelo: Vuelo):
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute(
        "CALL InsertVuelo(%s, %s, %s, %s, %s, %s, %s)",
        (
            nuevo_vuelo.numero,
            nuevo_vuelo.areolinea,
            nuevo_vuelo.destino,
            nuevo_vuelo.origen,
            nuevo_vuelo.fechaPartida,
            nuevo_vuelo.fechaLlegada,
            nuevo_vuelo.usuario,
        ),
    )
    connection.commit()
    cursor.close()
    connection.close()


def mostrar_vuelos() -> List[Vuelo]:
    connection = connection_pool.get_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM VUELO")
    vuelos = cursor.fetchall()
    cursor.close()
    connection.close()
    return [Vuelo(*info) for info in vuelos]


def mostrar_vuelo(numero: int) -> Vuelo:
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute("SELECT * FROM VUELO WHERE numero = %s", (numero,))
    info = cursor.fetchone()
    cursor.close()
    connection.close()
    return Vuelo(*info)


def editar_vuelo(numero: int, vuelo_modificado: VueloModificado):
    datos_actuales = mostrar_vuelo(numero)
    if not vuelo_modificado.areolinea:
        vuelo_modificado.areolinea = datos_actuales.areolinea
    if not vuelo_modificado.destino:
        vuelo_modificado.destino = datos_actuales.destino
    if not vuelo_modificado.origen:
        vuelo_modificado.origen = datos_actuales.origen
    if not vuelo_modificado.fechaPartida:
        vuelo_modificado.fechaPartida = datos_actuales.fechaPartida
    if not vuelo_modificado.fechaLlegada:
        vuelo_modificado.fechaLlegada = datos_actuales.fechaLlegada
    if not vuelo_modificado.usuario:
        vuelo_modificado.usuario = datos_actuales.usuario

    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)

    update_query = "CALL UpdateVuelo(%s,%s,%s,%s,%s,%s,%s)"
    values = (
        numero,
        vuelo_modificado.areolinea,
        vuelo_modificado.destino,
        vuelo_modificado.origen,
        vuelo_modificado.fechaPartida,
        vuelo_modificado.fechaLlegada,
        vuelo_modificado.usuario,
    )

    cursor.execute(update_query, values)
    connection.commit()

    cursor.close()
    connection.close()


def borrar_vuelo(numero: int):
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)

    delete_query = "CALL DeleteVuelo(%s)"
    values = (numero,)

    cursor.execute(delete_query, values)
    connection.commit()

    cursor.close()
    connection.close()
