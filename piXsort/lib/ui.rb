require "glimmer-dsl-libui"
require_relative "./image_queue"
require_relative "./source_folder"

class FormTable
  attr_accessor :current_text, :destinations, :new_dest_category, :box

  include Glimmer

  def initialize
    @queue = ImageQueue.new([
      SourceFolder.new("C:\\Users\\zamis\\OneDrive - vizientinc.com\\Documents\\Breadie2022 possible memes"),
    ])

    @current_text = "Click Next"
    destinations = []
  end

  def launch
    window("piXsort", 600, 600) {
      margined true

      box = vertical_box {
        button("Next Image") {
          on_clicked do
            p open_folder
           
            self.current_text = @queue.next_file.path
          end
        }

        button("Add Destination") {
          on_clicked do
            path = open_folder
           
            self.destinations.push(DestFolder.new(path, self.new_dest_category))
            p destinations
            Glimmer::LibUI.queue_main do
              msg_box('About', 'Glimmer Tetris - Glimmer DSL for LibUI Example - Copyright (c) 2021-2023 Andy Maleh')
              # button(self.new_dest_category) {
              #   p path
              # }
            end
          end
        }

        entry {
          label "New Dest"
          text <=> [self, :new_dest_category]
        }

        entry {
          label "Email"
          text <=> [self, :current_text]
        }
      }
    }.show
  end
end

FormTable.new.launch
