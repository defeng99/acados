%
% Copyright (c) The acados authors.
%
% This file is part of acados.
%
% The 2-Clause BSD License
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% 1. Redistributions of source code must retain the above copyright notice,
% this list of conditions and the following disclaimer.
%
% 2. Redistributions in binary form must reproduce the above copyright notice,
% this list of conditions and the following disclaimer in the documentation
% and/or other materials provided with the distribution.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.;

%

classdef AcadosOcpCost < handle
    % linear least-squares cost: || Vx*x + Vu*x + Vz*z ||^2_W
    properties
        % Lagrange term, initial
        cost_type_0   % cost type
        W_0           % weight matrix
        Vx_0          % x matrix coefficient
        Vu_0          % u matrix coefficient
        Vz_0          % z matrix coefficient
        yref_0        % reference
        Zl_0        % Hessian wrt lower slack
        Zu_0        % Hessian wrt upper slack
        zl_0        % gradient wrt lower slack
        zu_0        % gradient wrt upper slack

        cost_ext_fun_type_0 % casadi or generic
        cost_source_ext_cost_0 % C-source file of cost function
        cost_function_ext_cost_0 % C-function name

        % Lagrange term, intermediate
        cost_type   % cost type
        W           % weight matrix
        Vx          % x matrix coefficient
        Vu          % u matrix coefficient
        Vz          % z matrix coefficient
        yref        % reference
        Zl          % Hessian wrt lower slack
        Zu          % Hessian wrt upper slack
        zl          % gradient wrt lower slack
        zu          % gradient wrt upper slack
        cost_ext_fun_type % casadi or generic
        cost_source_ext_cost % C-source file of cost function
        cost_function_ext_cost % C-function name

        % Mayer term
        cost_type_e % cost type
        W_e         % weight matrix
        Vx_e        % x matrix coefficient
        yref_e      % reference
        Zl_e        % Hessian wrt lower slack
        Zu_e        % Hessian wrt upper slack
        zl_e        % gradient wrt lower slack
        zu_e        % gradient wrt upper slack
        cost_ext_fun_type_e % casadi or generic
        cost_source_ext_cost_e % C-source file of cost function
        cost_function_ext_cost_e % C-function name
    end
    methods
        function obj = AcadosOcpCost()
            % initial
            obj.cost_type_0   = []; % if empty then copy path cost
            obj.W_0           = [];
            obj.Vx_0         = [];
            obj.Vu_0        = [];
            obj.Vz_0        = [];
            obj.yref_0     = [];
            obj.Zl_0        = [];
            obj.Zu_0        = [];
            obj.zl_0        = [];
            obj.zu_0        = [];
            obj.cost_ext_fun_type_0 = 'casadi';
            obj.cost_source_ext_cost_0 = [];
            obj.cost_function_ext_cost_0 = [];
            % intermediate
            obj.cost_type   = 'AUTO';
            obj.W           = [];
            obj.Vx          = [];
            obj.Vu          = [];
            obj.Vz          = [];
            obj.yref        = [];
            obj.Zl          = [];
            obj.Zu          = [];
            obj.zl          = [];
            obj.zu          = [];
            obj.cost_ext_fun_type = 'casadi';
            obj.cost_source_ext_cost = [];
            obj.cost_function_ext_cost = [];
            % terminal
            obj.cost_type_e = 'AUTO';
            obj.W_e         = [];
            obj.Vx_e        = [];
            obj.yref_e      = [];
            obj.Zl_e        = [];
            obj.Zu_e        = [];
            obj.zl_e        = [];
            obj.zu_e        = [];
            obj.cost_ext_fun_type_e = 'casadi';
            obj.cost_source_ext_cost_e = [];
            obj.cost_function_ext_cost_e = [];
        end

        function s = struct(self)
            if exist('properties')
                publicProperties = eval('properties(self)');
            else
                publicProperties = fieldnames(self);
            end
            s = struct();
            for fi = 1:numel(publicProperties)
                s.(publicProperties{fi}) = self.(publicProperties{fi});
            end
        end

        function out = convert_to_struct_for_json_dump(self)
            out = self.struct();
            vector_properties = {'yref_0', 'Zl_0', 'Zu_0', 'zl_0', 'zu_0', 'yref', 'Zl', 'Zu', 'zl', 'zu', 'yref_e', 'Zl_e', 'Zu_e', 'zl_e', 'zu_e'};
            matrix_properties = {'W_0', 'Vx_0', 'Vu_0', 'Vz_0', 'W', 'Vx', 'Vu', 'Vz', 'W_e', 'Vx_e'};
            out = prepare_struct_for_json_dump(out, vector_properties, matrix_properties);
        end
    end
end

