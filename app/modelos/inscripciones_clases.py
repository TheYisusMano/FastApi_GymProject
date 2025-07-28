from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from app.database import Base

class InscripcionesClases(Base):
    __tablename__ = "inscripciones_clases"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    id_miembro: Column[int] = Column(Integer, ForeignKey("miembros.id"), nullable=False)
    id_clases: Column[int] = Column(Integer, ForeignKey("clases.id"), nullable=False)
    fecha_inscripcion: Column[DateTime] = Column(DateTime, nullable=False)
    asistencia: Column[Boolean] = Column(Boolean, default=False, nullable=False)

    
    miembros = relationship(argument="Miembros", back_populates="inscripciones_clases")
    clases = relationship(argument="Clases", back_populates="inscripciones_clases")
