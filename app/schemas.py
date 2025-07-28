from pydantic import BaseModel, Field
from decimal import Decimal as decimal
from datetime import date

class CrearMembresia(BaseModel):
    nombre: str = Field(..., min_length=3, max_length=50)
    caracteristicas: str = Field(None, min_length=5, max_length=50)
    precio: decimal 
    duracion_dias : int 
    fecha_creacion : date = Field(default_factory=date.today)
    estado_activo: bool = True


class DevolverMembresia(BaseModel):
    nombre: str 
    caracteristicas: str | None = None
    precio: decimal 
    duracion_dias : int 
    fecha_creacion : date
    estado_activo: bool
    

class ActualizarMembresia(BaseModel):
    nombre: str | None = Field(None, min_length=3, max_length=50)
    caracteristicas: str | None = Field(None, min_length=5, max_length=50)
    precio: decimal | None = None
    duracion_dias : int 
    fecha_creacion : date = Field(default_factory=date.today)
    estado_activo: bool = True
    