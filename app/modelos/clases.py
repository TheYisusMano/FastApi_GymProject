from sqlalchemy import Column, Integer, String, Text, DateTime, func, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class Clases(Base):
    __tablename__ = "clases"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    nombre: Column[str] = Column(String(length=50))
    id_entrenador: Column[int] = Column(Integer, ForeignKey("entrenadores.id"))
    descripcion: Column[Text] = Column(Text, nullable=True)
    duracion_minutos: Column[int] = Column(Integer, nullable=False)
    capacidad_maxima: Column[int] = Column(Integer, nullable=False)
    fecha: Column[DateTime] = Column(DateTime , nullable=False)
    horario_inicio: Column[DateTime] = Column(DateTime)
    horario_fin: Column[DateTime] = Column(DateTime, nullable=False)
    estado: Column[str] = Column(String(length=50), nullable=False)
    fecha_creacion: Column[DateTime] = Column(DateTime, default=func.now(), nullable=False)

    entrenadores = relationship(argument="Entrenadores", back_populates="clases")
    inscripciones_clases = relationship(argument="InscripcionesClases", back_populates="clases")