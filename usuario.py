from typing import List, Optional
from database import connection_pool
from dataclasses import dataclass


@dataclass
class Usuario:
    email: str
    nombres: str
    apellidos: str
    contraseña: str


@dataclass
class UsuarioModificado:
    nombres: Optional[str] = None
    apellidos: Optional[str] = None
    contraseña: Optional[str] = None


def crear_usuario(nuevo_usuario: Usuario):
    connection = connection_pool.get_connection()
    cursor = connection.cursor()
    cursor.execute(
        """INSERT INTO USUARIO (
            email,
            nombres,
            apellidos,
            contraseña
        ) VALUES (%s, %s, %s, %s)""",
        (
            nuevo_usuario.email,
            nuevo_usuario.nombres,
            nuevo_usuario.apellidos,
            nuevo_usuario.contraseña,
        ),
    )
    connection.commit()
    cursor.close()
    connection.close()


def mostrar_usuarios() -> List[Usuario]:
    connection = connection_pool.get_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM USUARIO")
    usuarios = cursor.fetchall()
    cursor.close()
    connection.close()
    return [Usuario(*info) for info in usuarios]


def mostrar_usuario(email: str) -> Usuario:
    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)
    cursor.execute("SELECT * FROM USUARIO WHERE email = %s", (email,))
    usuario_tupla = cursor.fetchone()
    cursor.close()
    connection.close()
    return Usuario(*usuario_tupla)


def editar_usuario(email: str, usuario_modificado: UsuarioModificado):
    datos_actuales = mostrar_usuario(email)
    if not usuario_modificado.nombres:
        usuario_modificado.nombres = datos_actuales.nombres
    if not usuario_modificado.apellidos:
        usuario_modificado.apellidos = datos_actuales.apellidos
    if not usuario_modificado.contraseña:
        usuario_modificado.contraseña = datos_actuales.contraseña

    connection = connection_pool.get_connection()
    cursor = connection.cursor(prepared=True)

    update_query = "UPDATE USUARIO SET nombres = %s, apellidos = %s, contraseña = %s WHERE email = %s"
    values = (
        usuario_modificado.nombres,
        usuario_modificado.apellidos,
        usuario_modificado.contraseña,
        email,
    )

    cursor.execute(update_query, values)
    connection.commit()

    cursor.close()
    connection.close()


def borrar_usuario(email: str):
    connection = connection_pool.get_connection()
    cursor = connection.cursor()

    delete_query = "DELETE FROM USUARIO WHERE email = %s"
    values = (email,)

    cursor.execute(delete_query, values)
    connection.commit()

    cursor.close()
    connection.close()
