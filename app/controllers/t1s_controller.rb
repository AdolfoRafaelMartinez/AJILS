require "net/http"
require "uri"
require 'socket'

SEPARATION_X = 10.0
SEPARATION_Y = 10.0

M = -1.77
B = -55.2

class T1sController < ApplicationController
  def index
    message1 = File.read("/home/ubuntu/app2213/ANT1_data.txt")
    message2 = File.read("/home/ubuntu/app2213/ANT2_data.txt")
    message3 = File.read("/home/ubuntu/app2213/ANT3_data.txt")
    message4 = File.read("/home/ubuntu/app2213/ANT4_data.txt")

    @rssi1 = message1.split(",")[1].to_i
    @rssi2 = message2.split(",")[1].to_i
    @rssi3 = message3.split(",")[1].to_i
    @rssi4 = message4.split(",")[1].to_i

    @sensor1_distance_model = model_distance M, B, @rssi1
    @sensor2_distance_model = model_distance M, B, @rssi2
    @sensor3_distance_model = model_distance M, B, @rssi3
    @sensor4_distance_model = model_distance M, B, @rssi4

    @x1_max = @sensor1_distance_model
    @y1_max = @sensor1_distance_model

    @x2_min = SEPARATION_X - @sensor2_distance_model
    @y2_max = @sensor2_distance_model

    @x3_min = SEPARATION_X - @sensor3_distance_model
    @y3_min = SEPARATION_Y - @sensor3_distance_model

    @x4_max = @sensor4_distance_model
    @y4_min = SEPARATION_Y - @sensor4_distance_model

    @min_x = get_closest @sensor1_distance_model, @sensor4_distance_model, @x1_max, @x4_max
    @max_x = get_closest @sensor2_distance_model, @sensor3_distance_model, @x2_min, @x3_min
    @min_y = get_closest @sensor1_distance_model, @sensor2_distance_model, @y1_max, @y2_max
    @max_y = get_closest @sensor3_distance_model, @sensor4_distance_model, @y3_min, @y4_min

    @expected_x = (@min_x + @max_x) / 2
    @expected_y = (@min_y + @max_y) / 2
  end

  private
    
  def model_distance m, b, rssi
    @sensor_distance_model = (rssi - b)/m
  end

  def get_closest d1, d2, v1, v2
    if d1 < d2 then
      v1
    else
      v2
    end
  end

end
