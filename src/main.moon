love.graphics.setBackgroundColor 245, 245, 245

export state = {
    running: {
        loop:   false
        update: true
        draw:   true
    }

    simulating: {
        loop:   true
        update: false
        draw:   false
    }
}

export main = {
    world: {}
    state: state.running
}

with love
    .load = ->
        with main
            .world = {
                population: {}
            }

            .state = state.running
    
    .update = (dt) ->
        with main
            if .state.update
                for a in *.world.population
                    main.process a, dt
    
    .draw = ->
        with main
            if .state.draw
                for a in *.world.population
                    main.blit_agent a

with main
    .process = (a, dt) ->
        a\process dt if a.process
    
    .blit_agent = (a) ->
        love.graphics.setColor 255, 255, 0
        love.graphics.circle "fill", a.x, a.y, a.radius