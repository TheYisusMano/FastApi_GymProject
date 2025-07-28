from sqlalchemy import Column, Integer, String, Numeric, Text, DateTime, Boolean , func
from sqlalchemy.orm import relationship
from app.database import Base

class Miembros(Base):
    __tablename__ = "miembros"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    apellido: Column[str] = Column(String(length=50), nullable=False)
    genero: Column[str] = Column(String(length=1), nullable=False) 
    direccion: Column[Text] = Column(Text, nullable=False)
    telefono: Column[str] = Column(String(length=15), nullable=False)
    email: Column[str] = Column(String(length=100), nullable=False, unique=True)
    fecha_registro: Column[DateTime]  = Column(DateTime, default=func.now(), nullable=False)
    estado_activo = Column(Boolean, default=True)

    inscripciones_clases = relationship(argument="InscripcionesClases", back_populates="miembros")
    inscripciones_membresias = relationship(argument="InscripcionesMembresias", back_populates="miembros") 