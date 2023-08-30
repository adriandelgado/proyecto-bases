from reportes import numero_likes_servicio
from reserva import (
    Reservas,
    ReservasModificada,
    borrar_reserva,
    crear_reserva,
    editar_reserva,
    mostrar_reservas,
)
from usuario import (
    Usuario,
    crear_usuario,
    mostrar_usuarios,
    UsuarioModificado,
    editar_usuario,
    borrar_usuario,
)
from vuelo import (
    Vuelo,
    VueloModificado,
    borrar_vuelo,
    crear_vuelo,
    editar_vuelo,
    mostrar_vuelos,
)


def menu_usuarios():
    while True:
        print("1. Crear usuario")
        print("2. Mostrar usuarios")
        print("3. Editar Usuario")
        print("4. Borrar usuario")
        print("5. Atrás")
        choice = input("Selecciona una opción: ")

        if choice == "1":
            email = input("Email del usuario: ")
            nombres = input("Nombres del usuario: ")
            apellidos = input("Apellidos del usuario: ")
            contraseña = input("Contraseña del usuario: ")
            nuevo_usuario = Usuario(email, nombres, apellidos, contraseña)
            crear_usuario(nuevo_usuario)
            print("Usuario añadido")
        elif choice == "2":
            usuarios = mostrar_usuarios()
            if usuarios:
                print("Usuarios:")
                for user in usuarios:
                    print(user)
            else:
                print("No hay usuarios")
        elif choice == "3":
            email = input("Email del usuario: ")
            nombres = input("Nuevos Nombres del usuario: ")
            apellidos = input("Nuevos Apellidos del usuario: ")
            contraseña = input("Nueva Contraseña del usuario: ")
            usuario_mod = UsuarioModificado(nombres, apellidos, contraseña)
            editar_usuario(email, usuario_mod)
            print("Usuario modificado")
        elif choice == "4":
            email = input("Email del usuario a borrar: ")
            borrar_usuario(email)
            print("Usuario borrado")
        elif choice == "5":
            break


def menu_vuelos():
    while True:
        print("1. Crear vuelo")
        print("2. Mostrar vuelos")
        print("3. Editar vuelo")
        print("4. Borrar vuelo")
        print("5. Atrás")
        choice = input("Selecciona una opción: ")

        if choice == "1":
            numero = input("Numero del vuelo: ")
            aerolinea = input("aerolinea del vuelo: ")
            destino = input("destino del vuelo: ")
            origen = input("origen del vuelo: ")
            fecha_partida = input("fecha_partida del vuelo: ")
            fecha_llegada = input("fecha_llegada del vuelo: ")
            usuario = input("usuario del vuelo: ")
            nuevo_vuelo = Vuelo(
                numero,
                aerolinea,
                destino,
                origen,
                fecha_partida,
                fecha_llegada,
                usuario,
            )
            crear_vuelo(nuevo_vuelo)
            print("Vuelo añadido")
        elif choice == "2":
            vuelos = mostrar_vuelos()
            if vuelos:
                print("Vuelos:")
                for vuelo in vuelos:
                    print(vuelo)
            else:
                print("No hay vuelos")
        elif choice == "3":
            numero = input("Numero del vuelo: ")
            aerolinea = input("aerolinea del vuelo: ")
            destino = input("destino del vuelo: ")
            origen = input("origen del vuelo: ")
            fecha_partida = input("fecha_partida del vuelo: ")
            fecha_llegada = input("fecha_llegada del vuelo: ")
            usuario = input("usuario del vuelo: ")
            vuelo_mod = VueloModificado(
                aerolinea,
                destino,
                origen,
                fecha_partida,
                fecha_llegada,
                usuario,
            )
            editar_vuelo(numero, vuelo_mod)
            print("Vuelo modificado")
        elif choice == "4":
            numero = input("Número del vuelo a borrar: ")
            borrar_vuelo(numero)
            print("Vuelo borrado")
        elif choice == "5":
            break


def menu_reservas():
    while True:
        print("1. Crear reserva")
        print("2. Mostrar reservas")
        print("3. Editar reserva")
        print("4. Borrar reserva")
        print("5. Atrás")
        choice = input("Selecciona una opción: ")

        if choice == "1":
            id = input("Id de la reserva: ")
            fecha = input("Fecha de la reserva: ")
            nombres = input("Nombres de la reserva: ")
            id_usuario = input("Email del usuario: ")
            nueva_reserva = Reservas(id, fecha, nombres, id_usuario)
            crear_reserva(nueva_reserva)
            print("Reserva añadida")
        elif choice == "2":
            reservas = mostrar_reservas()
            if reservas:
                print("Reservas:")
                for reserva in reservas:
                    print(reserva)
            else:
                print("No hay reservas")
        elif choice == "3":
            id = input("Id de la reserva: ")
            fecha = input("Fecha de la reserva: ")
            nombres = input("Nombres de la reserva: ")
            reserva_mod = ReservasModificada(fecha, nombres)
            editar_reserva(id, reserva_mod)
            print("Reserva modificada")
        elif choice == "4":
            numero = input("Número de la reserva a borrar: ")
            borrar_reserva(numero)
            print("Reserva borrada")
        elif choice == "5":
            break


def menu_reportes():
    while True:
        print("1. Mostrar número de likes de un servicio")
        print("2. Atrás")
        choice = input("Selecciona una opción: ")

        if choice == "1":
            nombre = input("Nombre del servicio: ")
            numero = numero_likes_servicio(nombre)
            print(f"El servicio tiene {numero} likes")
        elif choice == "2":
            break


def main():
    while True:
        print("Indique que desea consultar o editar")
        print("1. Usuarios")
        print("2. Vuelos")
        print("3. Reservas")
        print("4. Reportes")
        print("5. Salir")
        choice = input("Selecciona una opción: ")

        if choice == "1":
            menu_usuarios()
        elif choice == "2":
            menu_vuelos()
        elif choice == "3":
            menu_reservas()
        elif choice == "4":
            menu_reportes()
        elif choice == "5":
            print("¡Gracias!")
            break


if __name__ == "__main__":
    main()
