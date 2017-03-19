gauss_random = ->
    if return_v
        return_v = false
        return value_v

    u = 2 * math.random! - 1
    v = 2 * math.random! - 1

    r = u^2 + v^2

    if r == 0 or r > 1
        return gauss_random!

    c = math.sqrt -2 * (math.log r) / r
    value_v = v * c

    u * c

randf = (a, b) ->
    (b - a) * math.random! + a

randi = (a, b) ->
    math.floor (b - a) * math.random! + a

rand = (mu, sigma) ->
    mu + gauss_random! * sigma

{
    :gauss_random
    :randf
    :randi
    :rand
}