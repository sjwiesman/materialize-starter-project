{% macro drop_target_schema() %}
    {% do adapter.drop_schema(api.Relation.create(database=target.database, schema=target.schema)) %}
{% endmacro %}