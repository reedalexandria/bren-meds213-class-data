create trigger update_species
after insert on new_species
for each row
begin
	update new_species
	set scientific_name = NULL
	where Scientific_name = '';
end;

