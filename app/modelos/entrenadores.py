from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class Entrenadores(Base):
    __tablename__ = "entrenadores"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    apellido: Column[str] = Column(String(length=50), nullable=False)
    genero: Column[str] = Column(String(length=1), nullable=False)
    direccion: Column[Text] = Column(Text)
    telefono: Column[str] = Column(String(length=15))
    email: Column[str] = Column(String(length=100), nullable=False, unique=True)
    fecha_registro: Column[DateTime]  = Column(DateTime)
    especialidad: Column[str] = Column(String(length=50))
    certifcicacion: Column[Text] = Column(Text, nullable=False)

    clases = relationship(argument="Clases", back_populates="entrenadores")
    inscripciones_membresias = relationship(argument="InscripcionesMembresias", back_populates="entrenadores")