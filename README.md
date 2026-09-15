# Biblioteca Campus

## Consultas

Listar todos los libros disponibles
```sql
select *
from libro l
where l.disponibilidad = TRUE;
```

Buscar libros por género
```sql
select *
from libro l
where l.genero = 'Novela';
```

Obtener información de un libro por ISBN
```sql
select *
from libro l
where l.isbn = '978-8437604572';
```

Contar el número de libros en la biblioteca
```sql
select count(*) as total_libros
from libro;
```

Listar todos los autores
```sql
select *
from autor;
```

Buscar autores por nombre
```sql
select *
from autor a
where a.nombre = 'Gabriel';
```

Obtener todos los libros de un autor específico
```sql
select *
from libro l
join libro_autor la on la.idLibro = l.idLibro
join autor a on a.idAutor = la.idAutor
where a.nombre = 'Gabriel';
```

Listar todas las ediciones de un libro
```sql
select *
from publicacion p
join libro l on l.idLibro = p.idLibro
where l.titulo = 'Cien Años de Soledad';
```

Obtener la última edición de un libro
```sql
select *
from publicacion p
join libro l on l.idLibro = p.idLibro
where l.titulo = 'Cien Años de Soledad'
order by fechaPublicacion desc
limit 1;
```

Contar cuántas ediciones hay de un libro específico
```sql
select count(*) as total_ediciones
from publicacion p
join libro l on l.idLibro = p.idLibro
where l.titulo = 'Cien Años de Soledad';
```

Listar todas las transacciones de préstamo
```sql
select *
from transaccion t;
```

Obtener los libros prestados actualmente
```sql
select l.titulo, t.fechaPrestamo, t.estado
from transaccion t
join libro l on l.idLibro = t.idLibro
where t.estado in ('prestado', 'atrasado');
```

Contar el número de transacciones de un miembro específico
```sql
select count(*) as total_transacciones
from transaccion t
join miembro m on m.idMiembro = t.idMiembro
where m.nombre = 'Laura';
```

Listar todos los miembros de la biblioteca
```sql
select *
from miembro m;
```

Buscar un miembro por nombre:
```sql
select *
from miembro m
where m.nombre = 'Laura';
```

Obtener las transacciones de un miembro específico
```sql
select *
from transaccion t
join miembro m on m.idMiembro = t.idMiembro
where m.nombre = 'Laura';
```

Listar todos los libros y sus autores
```sql
select l.titulo, concat(a.nombre, ' ', a.apellido) as autor
from libro l
join libro_autor la on la.idLibro = l.idLibro
join autor a on a.idAutor = la.idAutor
order by l.titulo;
```

Obtener el historial de préstamos de un libro específico
```sql
select t.fechaPrestamo, t.fechaDevolucion, t.estado, m.nombre, m.apellido
from transaccion t
join libro l on l.idLibro = t.idLibro
join miembro m on m.idMiembro = t.idMiembro
where l.titulo = 'Cien Años de Soledad'
order by t.fechaPrestamo desc;
```

Contar cuántos libros han sido prestados en total
```sql
select count(*) as total_prestamos
from transaccion t;
```

Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
select l.titulo, l.disponibilidad, p.numeroEdicion, p.fechaPublicacion, p.editorial
from libro l
join publicacion p on p.idLibro = l.idLibro
where p.numeroEdicion = (
    select max(p2.numeroEdicion)
    from publicacion p2
    where p2.idLibro = l.idLibro
);
```
