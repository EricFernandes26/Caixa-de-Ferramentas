SELECT concat('CREATE DATABASE ',schema_name,'; ',DEFAULT_CHARACTER_SET_NAME,' - ',DEFAULT_COLLATION_NAME) txt FROM information_schema.schemata where schema_name not in ('mysql','information_schema','sys','performance_schema');