require "glimmer-dsl-libui"
require_relative "./image_queue"
require_relative "./source_folder"
require_relative "./dest_folder"
require_relative "./transfer_service"

class FormTable
  attr_accessor :current_text, :destinations, :new_dest_category, :box

  include Glimmer

  def initialize
    @transfer_service = OtherTransferService.new
    @queue = ImageQueue.new([
      SourceFolder.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes"),
    ])
    

    @current_text = "Click Next"
    
    @destinations = [
      DestFolder.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Desktop\\copied", "Wow")
    ]
  end

  def launch
    window("piXsort", 600, 600) {
      margined true

      vertical_box {
        box = horizontal_box {
          button("Next Image") {
            on_clicked do
              @current_file = @queue.next_file
              self.current_text = @current_file.path
             
            end
          }

          button("Add Destination") {
            on_clicked do
              path = open_folder
              dest = DestFolder.new(path, "new")
              @destinations.push(dest)
              @button_box.content {
                create_button(dest)
              }
            
            end
          }
        }

        area {
           text(0, 0, 500) { # declarative stable text
            @text = string("Area Gallery") {
              font family: "Arial", size: (OS.mac? ? 14 : 11)
              color :black
              string <= [self, :current_text]
            }
          }
        }

        @button_box = horizontal_box {

          
          @destinations.each do |dest|
            create_button(dest)
          end
        }
      }
    }.show
  end

  private

  def create_button(dest)
    button(dest.category) {
      on_clicked do
        @transfer_service.transfer_file(@current_file, dest)

      end
    }
  end
end

FormTable.new.launch
