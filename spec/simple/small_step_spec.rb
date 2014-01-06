require 'spec_helper'
require_relative '../../simple/small_step'

describe Machine do
  let(:program) do
    While.new(
      LessThan.new(
        Variable.new(:x),
        Number.new(9)
      ),
      Assign.new(
        :x,
        Multiply.new(
          Variable.new(:x),
          Number.new(3)
        )
      )
    )
  end

  it "does a calculation innit" do
    machine = Machine.new(program, {:x => Number.new(1)})

    machine.run

    expect(machine.environment).to eq({:x => Number.new(9)})
  end
end
