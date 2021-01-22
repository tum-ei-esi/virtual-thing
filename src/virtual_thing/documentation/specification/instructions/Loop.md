# Loop
Is a type of [Instruction] that is used to execute a block of instructions repeatedly, i.e. an analog of different kinds of loops in programming languages.

## Schema

Type: `object`
| Property | Description | Mandatory | Type | Default |
|----------|-------------|:---------:|------|:-------:|
|iterator|The iterator variable. Must point to a number value. If omitted, the loop is a **`"while"`** loop.||[Pointer]||
|initialValueExpr|The initialization value of the `iterator`. ||[Math]|"0"|
|condition|The condition of the loop. The value of the expression will be interpreted as a boolean. If omitted, then the loop is an **`"infinite"`** loop.||[Math]||[Math]||
|increment|The number that will be added to the `iterator` after each iteration.||`number`|1|
|instructions|The instructions to execute in every iteration.||Array of [Instruction], at least 1 item||
|conditionFirst|Defines the order of *checking the condition* and *executing the iteration*, i.e. **`"do-while"`** or **`"while-do"`**.||`boolean`|true|
|interval|A "best-effort" (see [Interval behavior][intbeh]) time interval between two consecutive iterations. If is set to `"0"` or omitted, the loop will execute as fast as possible.||[Interval]||
|comment|A property to use on your own purpose, ignored by the [Engine].||`string` or Array of `string`||

**\*** additional properties are not allowed.

> !!!WARNING Please use loops with caution. If a loop has no [Instruction] and no [Interval], i.e. a busy waiting loop, then it may block the program thread. If such a loop is supposed to wait for a long time, e.g. while polling something using the `"condition"` property, then it is recommended to specify some [Interval] (e.g. at least few ms) such that the loop periodically yields the program control while awaiting the [Interval].


[Engine]: ../Definitions.md#virtual-thing-engine-and-engine

[Instruction]: Instruction.md

[Pointer]: ../helper_components/Pointer.md
[Interval]: ../helper_components/Interval.md
[intbeh]: ../helper_components/Interval.md#Behavior
[Math]: ../helper_components/Math.md