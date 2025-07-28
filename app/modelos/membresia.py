from sqlalchemy import Column, Integer, String, Numeric, DateTime, Boolean , func
from decimal import Decimal as decimal
from app.database import Base

class Membresia(Base):
    __tablename__ = "membresia"

    id: Column[int] = Column(Integer, primary_key=True, index=True)
    nombre: Column[str] = Column(String(length=50), nullable=False)
    caracteristicas: Column[str] = Column(String(length=50), nullable=False)
    duracion_dias: Column[int] = Column(Integer, nullable=False) 
    fecha_creacion: Column[DateTime]  = Column(DateTime, default=func.now(), nullable=False)
    estado_activo = Column(Boolean, default=True)
    precio: Column[decimal] = Column(Numeric(10,2), nullable=False) 
