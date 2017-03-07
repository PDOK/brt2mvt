CREATE OR REPLACE FUNCTION z(float)
  RETURNS integer AS
$BODY$
begin
    -- Don't bother if the scale is larger than ~zoom level 0
    if $1 > 600000000 then
        return null;
    end if;
    return round(log(2,559082264.028/$1::numeric));
end;
$BODY$
  LANGUAGE plpgsql IMMUTABLE
  COST 100;
