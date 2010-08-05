require "#{File.dirname(__FILE__)}/translator"

describe Translator do
  before do
    @translator = Translator.new
  end
  
  it "#to_foreign should return a hash" do
    @translator.to_foreign.kind_of?(Hash).should == true
  end
  
  it "#to_foreign should be able to traslate from English to Spanish, French, Chinese and Swahili" do
    [:japanese, :french, :spanish, :swahili].each do |lang|
      @translator.to_foreign.keys.should include lang
    end
  end
  
  it "#to_foreign should contain dictionaries (hashes) for Spanish, French, Chinese and Swahili" do
    @translator.to_foreign[:spanish].kind_of?(Hash).should == true
    @translator.to_foreign[:french].kind_of?(Hash).should == true
    @translator.to_foreign[:japanese].kind_of?(Hash).should == true
    @translator.to_foreign[:swahili].kind_of?(Hash).should == true
  end
  
  it "#to_foreign should translate hello" do
    @translator.to_foreign[:spanish]["hello"].should == "hola"
    @translator.to_foreign[:french]["hello"].should == "bonjour"
    @translator.to_foreign[:japanese]["hello"].should == "konnichiha"
    @translator.to_foreign[:swahili]["hello"].should == "jambo"
  end
  
  it "#to_foreign should translate goodbye" do
    @translator.to_foreign[:spanish]["goodbye"].should == "adios"
    @translator.to_foreign[:french]["goodbye"].should == "au revior"
    @translator.to_foreign[:japanese]["goodbye"].should == "sayonara"
    @translator.to_foreign[:swahili]["goodbye"].should == "kwaheri"
  end
  
  
  it "#to_english should return a hash" do
    @translator.to_english.kind_of?(Hash).should == true
  end
  
  #write your own specs for #to_english & make them pass
end