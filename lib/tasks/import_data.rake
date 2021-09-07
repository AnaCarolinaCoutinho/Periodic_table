namespace :import do
  desc 'Import periodic table data from json'

  task execut: :environment do
    file = File.read("db/data.json")
    @elements = JSON.parse(file)
    @elements.each do |element|
      table = Element.where(name: element[0])
      if table.count == 0
        element[1].each do |name_element|
          Element.create(name: name_element)
        end
      else
        table = table.first
        table.name = element[1]["name"]
        table.atomic_mass = element[1]["atomic_mass"]
        table.number = element[1]["number"]
        table.period = element[1]["period"]
        table.category = element[1]["category"]
        table.symbol = element[1]["symbol"]
        table.xpos = element[1]["xpos"]
        table.ypos = element[1]["ypos"]
        table.save 

      end
    end
  end
end

