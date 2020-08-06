require "yaml"

module BasicSerialization
    @@serializer = YAML 

    def serialize()
        obj = {}
        instance_variables.map do |var|
            obj[var] = instance_variable_get(var)
        end
        @@serializer.dump obj
    end

    def unserialize()
        obj = YAML::load(File.read("save.yml"))
        obj.keys.each do |key|
            instance_variable_set(key, obj[key])
        end
    end
end