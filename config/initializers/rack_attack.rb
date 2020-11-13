class Rack::Attack
  # Prevent IPs from saturating database with new sessions
  # LV 1: per minute, LV 2: per hour, LV 3: per day
  throttle("req /new_session /ip lv.1",
            limit:  3, period: 1.minute)  do |req|
    if req.path == '/api/session_groups/new_session' && req.get?
      req.ip
    end
  end

  throttle("req /new_session /ip lv.2",
            limit:  6, period: 1.hour)  do |req|
    if req.path == '/api/session_groups/new_session' && req.get?
      req.ip
    end
  end

  throttle("req /new_session /ip lv.3",
            limit:  10, period: 1.day)  do |req|
    if req.path == '/api/session_groups/new_session' && req.get?
      req.ip
    end
  end
end
