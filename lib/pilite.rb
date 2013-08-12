#!/usr/bin/env ruby
# coding: UTF-8

# lib/pilite.rb
# 
# ruby library for controlling Pi-LITE board
# (http://shop.ciseco.co.uk/pi-lite-lots-of-leds-for-the-raspberry-pi-0805-red/)
#
# created on : 2013.08.09
# last update: 2013.08.12
# 
# by meinside@gmail.com

require "serialport"

module PiLite
  class Commands
    @@pilite = nil

    private
    def initialize(port, params)
      @serial = SerialPort.new(port, params)
    end
    def command(cmd)
      @serial.write("$$$#{cmd}\r")
    end

    public
    def self.start(port = "/dev/ttyAMA0", params = {baudrate: 9600}, &block)
      @@pilite = PiLite::Commands.new(port, params) unless @@pilite

      if block_given?
        yield @@pilite 
      else
        return @@pilite
      end
    end

    # change scroll speed
    # @param value [Number] scrolling delay from 1ms to 1000ms (default: 80)
    def speed(value)
      command "SPEED#{value}"
    end

    # print framebuffer
    # @param bits [String/Array] array of 0/1s for each LED's state (0:off, 1:on, 14 x 9 total)
    def fbuffer(bits)
      bits = bits.join if bits.kind_of? Array
      command "F#{bits}"
    end

    # draw a bar at given column with provided value (this command does not overwrite the screen)
    # @param column [Number] column number (1 ~ 14)
    # @param value [Number] percentage (0 ~ 100)
    def bar(column, value)
      command "B#{column},#{value}"
    end

    # draw VU meter
    # @param row [Number] row number (1 ~ 2)
    # @param value [Number] percentage (0 ~ 100)
    def vumeter(row, value)
      command "V#{row},#{value}"
    end

    # do an action on a pixel at given column/row
    # @param column [Number] column number (1 ~ 14)
    # @param row [Number] row number (1 ~ 9)
    # @param action [Symbol] :on / :off / :toggle
    def pixel(column, row, action)
      command "P#{column},#{row},#{action.to_s.upcase}"
    end

    # turn on/off all LEDs
    # @param action [Symbol] :on / :off
    def all(action)
      command "ALL,#{action.to_s.upcase}"
    end

    # scroll to left or right with given offset
    # @param offset [Number] -1 ~ -14: shift to right / 1 ~ 14: shift to left
    def scroll(offset)
      command "SCROLL#{offset}"
    end

    # print a character at given column/row
    # @param column [Number] column number (1 ~ 14)
    # @param row [Number] row number (1 ~ 9)
    # @param char [String] character
    def char(column, row, char)
      command "T#{column},#{row},#{char}"
    end

    # print text (will be scrolled automatically)
    # @param str [String] text
    def text(str)
      @serial.write("#{str}\r")
    end
  end
end

