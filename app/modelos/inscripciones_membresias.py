from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

class InscripcionesMembresias(Base):
    __tablename__ = "inscripciones_membresias"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    id_entrenadores: Column[int] = Column(Integer, ForeignKey("entrenadores.id"), nullable=False)
    id_miembros: Column[int] = Column(Integer, ForeignKey("miembros.id"), nullable=False)
    id_membresia: Column[int] = Column(Integer, ForeignKey("membresia.id"), nullable=False)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    caracteristicas: Column[str] = Column(String(length=50), nullable=False)
    fecha_inicio: Column[DateTime]  = Column(DateTime, nullable=False)
    fecha_fin: Column[DateTime]  = Column(DateTime, nullable=False)
    estado: Column[str] = Column(String(length=50), nullable=False)
    fecha_ultima_actualizacion: Column[DateTime]  = Column(DateTime, nullable=False)
    
    entrenadores = relationship(argument="Entrenadores", back_populates="inscripciones_membresias")
    miembros = relationship(argument="Miembros", back_populates="inscripciones_membresias") 
    membresia = relationship(argument="Membresia", back_populates="inscripciones_membresias") 