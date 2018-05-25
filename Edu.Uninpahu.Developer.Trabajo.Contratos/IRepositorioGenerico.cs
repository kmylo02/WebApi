using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Edu.Uninpahu.Developer.Trabajo.Contratos
{
    public interface IRepositorioGenerico<TEntity>
    {
        IEnumerable<TEntity> ObtenerTodos();

        IEnumerable<TEntity> ObtenerPor(Expression<Func<TEntity, bool>> predicado);

        bool Agregar(TEntity entity);

        bool Editar(TEntity entity);

        bool Eliminar(TEntity entity);

        void Guardar();
    }
}
