function [ output_txt ] = CursorUpdateFunction( ~, event_obj )
    pos = get(event_obj,'Position');
    output_txt = {['time: ',datestr(pos(1))],['amplitude: ',num2str(pos(2))]};
end

