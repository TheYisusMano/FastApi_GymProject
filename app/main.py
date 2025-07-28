from fastapi import FastAPI, Body, status
from app.schemas import CrearMembresia, DevolverMembresia, ActualizarMembresia
from typing import Annotated
from app.database import engine, SessionLocal, Base
from sqlalchemy import insert, select, update, delete
from app.modelos.membresia import Membresia
from app.modelos.clases import Clases
from app.modelos.entrenadores import Entrenadores
from app.modelos.inscripciones_clases import InscripcionesClases
from app.modelos.inscripciones_membresias import InscripcionesMembresias
from app.modelos.miembros import Miembros 
from app.database import engine, SessionLocal, Base

Base.metadata.create_all(bind=engine)
app = FastAPI() 
@app.post(
    "/membership/",
    status_code=status.HTTP_201_CREATED,
    description="Crear membresia",
    response_model=str
    )

async def create_membership(
    membresia: Annotated[CrearMembresia, Body()]
):
    conexion = SessionLocal()

    sentencia = insert(Membresia).values(
        nombre=membresia.nombre,
        caracteristicas=membresia.caracteristicas,
        precio=membresia.precio,
        duracion_dias=membresia.duracion_dias,
        fecha_creacion=membresia.fecha_creacion,
        estado_activo=membresia.estado_activo
    )

    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()

    return "ok"

@app.get(
    "/membership/",
    status_code=status.HTTP_200_OK,
    description="Mostrar membresía",
    response_model=list[DevolverMembresia],
    )
async def read_membership(): 
    conexion = SessionLocal()

    sentencia = select(
        Membresia.id,
        Membresia.nombre,
        Membresia.caracteristicas,   
        Membresia.precio,
        Membresia.duracion_dias,
        Membresia.fecha_creacion,
        Membresia.estado_activo
        ).select_from(Membresia)
    
    resultado = conexion.execute(sentencia)
    resultados = resultado.all()

    conexion.close()

    return resultados


@app.delete(
    "/membership/{membership_id}",
    status_code=status.HTTP_200_OK,
    description="Eliminar membresia",
    response_model=str
    )
async def delete_membership(membership_id: int):
    conexion = SessionLocal()

    sentencia = delete(table=Membresia).where(Membresia.id == membership_id)

    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()

    return "ok"

@app.put(
    "/membership/{membership_id}",
    status_code=status.HTTP_200_OK,
    description="Actualizar membresia",
    response_model=str
    )
async def update_membership(
    membership_id: int,
    membership_actualizado: Annotated[ActualizarMembresia, Body()]
): 
    conexion = SessionLocal()

    valores = membership_actualizado.model_dump(exclude_unset=True)

    sentencia = update(Membresia).values(valores).where(Membresia.id == membership_id)


    conexion.execute(sentencia)
    conexion.commit()
    conexion.close()

    return "ok"

# Creamos una instancia de FastAPI, este es el punto de entrada de 
# nuestra API

# A partir de aquí, crearemos nuestra api:

# Creamos una ruta GET, esta se ejecutará si el usuario accede a la ruta /.
# Ejemplo: http://localhost:8000/
@app.get("/") 
def read_root():
    return {"message": "¡Hola, FastAPI!"}

# Creamos una ruta GET con un parámetro, 
# esto se ejecutará si el usuario accede a la ruta /items/{item_id}.
# Ejemplo: http://localhost:8000/items/1
@app.get("/items/{item_id}") 
def read_item(item_id: int):
    return {"item_id": item_id}
