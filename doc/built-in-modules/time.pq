[[[H‘Module time’
]]]H‘Module time’


H(-1)‘Time methods’

*‘Time’()
Return the current time.

*‘Time’(year, month = 1, day = 1, hour = 0, minute = 0, Float second = 0)
Constructs a Time object from specified arguments.

*‘Time’(', Float unix_time)
[[[Return/]]]Constructs [[[the time]]]a Time object corresponding to the POSIX timestamp (i.e. seconds since the epoch).

*‘unix_time’()
Return seconds since the epoch as a floating point number.

*‘strftime’(format)
Return a string representing the time, controlled by an explicit format string. For a complete list of formatting directives, see [https://en.cppreference.com/w/c/chrono/strftime].

*‘format’(fmt)
Similar to `strftime()`, but format is much simpler:
T‘
‘‘YYYY’ ‘year[[[ as a decimal number]]], e.g. 2018’’
‘‘YY’   ‘last 2 digits of year[[[ as a decimal number]]], e.g. 18’’
‘‘MMM’  ‘month as abbreviated name, e.g. Oct’’
‘‘MM’   ‘month as a decimal number (range [01, 12])’’
‘‘DD’   ‘day of the month[[[ as a decimal number]]] (range [01, 31])’’
‘‘hh’   ‘hour in 24h format (range [00, 23])’’
‘‘mm’   ‘minute[[[ as a decimal number]]] (range [00, 59])’’
‘‘ss’   ‘second[[[ as a decimal number]]] (range [00, 60])’’
’


H(-1)‘TimeDelta methods and members’

*‘TimeDelta’(', days = 0, hours = 0, minutes = 0, seconds = 0, milliseconds = 0, microseconds = 0, weeks = 0)
Constructor.

*‘seconds’
Number of seconds.

*‘days’()
Number of days.

The following operators are supported:
```
Time - Time -> TimeDelta
Time + TimeDelta -> Time
Time - TimeDelta -> Time
```


H(-1)‘time functions’

time:*‘today’()
Return the current time as #(11l)‘Time(current_year, current_month, current_day)’.

time:*‘strptime’(string, format) -> Time
Parse a string representing a time according to a format.
The `format` parameter uses the same directives as those used by `Time.strftime()`.

time:*‘perf_counter’()
Return the value of a performance counter, i.e. a clock with the highest available resolution to measure a short duration.
It can be used as follows:
#(11l)‘
V start = time:perf_counter()
...
print(‘Elapsed: ’(time:perf_counter() - start)‘ seconds’)
’
