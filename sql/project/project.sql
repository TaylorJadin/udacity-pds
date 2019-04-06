-- https://classroom.udacity.com/nanodegrees/nd104/parts/1954dd2c-6bfd-4d92-b59b-40d6dd298f24/modules/ea7f4990-0e12-4009-ab5d-dfc0353f2505/lessons/3dc22711-adb9-4e58-a299-fc89bce79d86/concepts/eebd783f-5a4d-45a8-9f8d-25ab6ea93946

-- https://drive.google.com/drive/u/0/folders/1LnCltr2T0p-hmh7-UkHoLuVjl_irEF5O

select f.title film_title, c.name category_name, count(*) rental_count
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
join inventory i on f.film_id = i.film_id 
join rental r on i.inventory_id = r.inventory_id
group by 1, 2
order by 3 desc;