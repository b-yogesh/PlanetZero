from django.contrib import admin
from server.endpoints.models import Endpoint, MLRequest,MLAlgorithm,MLRequest
# Register your models here.
class EndpointAdmin (admin.ModelAdmin):
    fields = ["id", "name", "owner", "created_at"]

class MLRequestAdmin (admin.ModelAdmin):
    fields = ["id",
            "input_data",
            "full_response",
            "response",
            "feedback",
            "created_at",
            "parent_mlalgorithm"]


class MLAlgorithmAdmin (admin.ModelAdmin):
    fields = ["id", "name", "description", "code",
                            "version", "owner", "created_at",
                            "parent_endpoint", "current_status"]  

class MLRequestAdmin (admin.ModelAdmin):
    fields = ["id", "active", "status", "created_by", "created_at",
                            "parent_mlalgorithm"]  

# admin.site.register(MLRequest, MLRequestAdmin)
admin.site.register(MLAlgorithm, MLAlgorithmAdmin)
admin.site.register(MLRequest, MLRequestAdmin)
admin.site.register(Endpoint, EndpointAdmin)
 
