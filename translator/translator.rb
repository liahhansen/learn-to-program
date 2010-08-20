class Translator
  def to_english
    {}
  end
  
  def to_foreign
    {:spanish => {"hello" => "hola", "goodbye" => "adios"}, :french => {"hello" => "bonjour", "goodbye" => "au revior"}, :japanese => {"hello" => "konnichiha", "goodbye" => "sayonara"}, :swahili => {"hello" => "jambo", "goodbye" => "kwaheri"}}
  end
end